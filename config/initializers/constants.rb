if Rails.env == 'production'
    ## 本番の定数
    SITE_TITLE = 'zucker'
else
    ## 開発の定数
    SITE_TITLE = 'zucker(dev)'
end
