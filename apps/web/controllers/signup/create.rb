require 'bcrypt'

module Web::Controllers::Signup
  class Create
    include Web::Action

    expose :user

    params do
      required(:signup).schema do
        required(:first_name).filled(:str?)
        required(:last_name).filled(:str?)
        required(:email).filled(:str?)
        required(:password).filled(:str?).confirmation
      end
    end

    def hash_password(password)
      return BCrypt::Password.create(password)
    end

    def call(params)
      if params.valid?
        params[:signup][:password] = hash_password(params[:signup][:password])
        @user = UserRepository.new.create(params[:signup])
        redirect_to '/'
      else
        self.status = 422
      end
    end
  end
end
