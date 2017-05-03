class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create

    puts "Hola mundo"
   # begin


  #     RestClient.post "https://api:key-0d5bf1842487e19e86639097949b56dd"\
  # "@api.mailgun.net/v3/experienciaganadora.com/messages",
  #                     :from => "ivan@experienciaganadora.com",
  #                     :to => "ivantrips1@gmail.com",
  #                     :subject => "Hello",
  #                     :text => "Testing some Mailgun awesomeness!",
  #                     "o:deliverytime" => "Fri, 25 Oct 2011 23:10:10 -0000"
  #
  #   rescue RestClient::ExceptionWithResponse => e
  #     puts e.response
  #   end

    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
