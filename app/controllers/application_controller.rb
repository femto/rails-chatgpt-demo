class ApplicationController < ActionController::Base
  def configure_openai_key
    key = params[:api_key]
    # 这里可以将API Key保存到数据库中，或者存储到环境变量中
    # 为了简单起见，这里只将API Key保存到session中
    session[:openai_key] = key

    OpenAI.configure do |config|
      config.access_token = key
    end
    # 重定向回原来的页面
    redirect_back(fallback_location: root_path)
  end
end
