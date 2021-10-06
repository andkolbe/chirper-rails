class CommentsController < ApplicationController
    def create
        @chirp = Chirp.find(params[:chirp_id])
        @comment = @chirp.comments.create(comment_params)
        redirect_to chirp_path(@chirp)
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
