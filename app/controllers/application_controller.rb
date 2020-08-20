class ApplicationController < ActionController::Base

    helper_method :current_user, :lift_price

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def log_check
        return unless current_user.nil?
        flash[:error] = "Log in to perform this action."
        redirect_to login_path
    end

    def nil_check
        return unless !current_user.nil?
        flash[:error] = "Log out to perform this action."
        redirect_to home_path
    end

    def admin_check
        return unless !current_user.admin?
        flash[:error] = "Need admin rights to perform this action."
        redirect_to home_path
    end

    def lift_price
        50
    end

    def clear_pending_lp
        LiftPass.all.find_all {|l| l.user_id == current_user.id}.each do |lp|
            if lp.reservation.nil?
              lp.destroy
            end
        end
    end

    def clear_pending_gb
        GearBag.all.find_all {|g| g.user_id == current_user.id}.each do |gb|
            if gb.reservation.nil?
              gb.destroy
            end
        end
    end

end
