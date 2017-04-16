class NewsContentsController < InheritedResources::Base

  private

    def news_content_params
      params.require(:news_content).permit(:title, :content, :sendtime, :newsletter_id)
    end
end

