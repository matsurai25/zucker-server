class LandingController < ActionController::Base
  before_action :set_locale
  layout 'application_landings'

  def index
  end

  private
    # I18n.locale をセットする
    def set_locale
      I18n.locale = locale_in_params || locale_in_accept_language || I18n.default_locale
    end

    # params の locale の値（優先すべき）
    # @return [Symbol]
    #   params から取った locale
    #   有効な値でなければ :en
    #   取得できなかった場合 nil
    def locale_in_params
      if params[:locale].present?
        params[:locale].to_sym.presence_in(I18n::available_locales) || I18n.default_locale
      else
        nil
      end
    end

    # 環境変数 HTTP_ACCEPT_LANGUAGE を順に検証し、最初に一致した有効な locale を返す
    # @return [Symbol]  環境変数 HTTP_ACCEPT_LANGUAGE から取った locale 。取得できなかった場合 nil
    def locale_in_accept_language
      request.env['HTTP_ACCEPT_LANGUAGE']
        .to_s # nil 対策
        .split(',')
        .map{ |_| _[0..1].to_sym }
        .select { |_| I18n::available_locales.include?(_) }
        .first
    end

    # 全リンクに locale 情報をセットする
    # @return [Hash] locale をキーとするハッシュ
    def default_url_options(options = {})
      { locale: I18n.locale }
    end
end
