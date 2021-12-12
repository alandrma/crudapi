class Article < ApplicationRecord
    
    validates :title, presence: true
    validates :body, presence: true

    has_one_attached :media
    def media_url
        Rails.application.routes.url_helpers.rails_blob_url(
        media.blob, only_path: true)
    end
end

    # def media_url
            #     rails_blob_path(article.media_url, disposition: "attachment", only_path: true)
            #  end

        # # linking to a variant full url
        # def media_url
        #     variant = logo.variant(resize: "1600x200>")   
        #     Rails.application.routes.url_helpers.rails_representation_url(
        #     variant, 
        #     Rails.application.config.action_mailer.default_url_options
        #     )
        # end

        # # linking to a original blob full url
    # validates :media_url, presence: true, attribute :media_image_url
    

