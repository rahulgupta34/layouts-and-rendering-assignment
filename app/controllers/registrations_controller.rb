class RegistrationsController < Devise::RegistrationsController
    def new
        super
    end

    def edit
      super
    end
    
    def create
       @user = User.new(user_params)
       if @user.save
          redirect_to root_path
       else
        render :new, status: :unprocessable_entity
       end
    end

    def update
      
      if @user.update(user_params)
         redirect_to root_path
      else
       render :edit, status: :unprocessable_entity
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
end
