# class CommentsController < ApplicationController
#   respond_to :js
#   before_action :authenticate!, only: [:create, :edit, :update, :new, :destroy]
#
#   def index
#     @topic = Topic.includes(:posts).friendly.find(params[:topic_id])
#     @post = @topic.posts.friendly.find(params[:post_id])
#     @comments = @post.comments.order("created_at DESC").page (params[:page])
#     @comment = Comment.new
#   end
#
#   def create
#     @topic = Topic.friendly.find(params[:topic_id])
#     @post = @topic.posts.friendly.find(params[:post_id])
#     @comment = current_user.comments.build(comment_params.merge(post_id: @post.id))
#     @new_comment = Comment.new
#     authorize @comment
#
#     if @comment.save
#       CommentBroadcastJob.perform_later("create", @comment)
#       flash.now[:success] = "You've created a new comment."
#     else
#       flash.now[:danger] = @comment.errors.full_messages
#     end
#   end
#
#   def edit
#     @comment = Comment.find_by(id: params[:id])
#     @post = @comment.post
#     @topic = @post.topic
#     authorize @comment
#
#   end
#
#   def update
#     @comment = Comment.find_by(id: params[:id])
#     @post = @comment.post
#     @topic = @post.topic
#     authorize @comment
#     if @comment.update(comment_params)
#       CommentBroadcastJob.perform_later("update", @comment)
#       flash.now[:success] = "You've updated the comment."
#     else
#       flash.now[:danger] = @comment.errors.full_messages
#     end
#   end
#
#   def destroy
#     @comment = Comment.find_by(id: params[:id])
#     @post = @comment.post
#     @topic = @post.topic
#     authorize @comment
#
#     if @comment.destroy
#       CommentBroadcastJob.perform_now("destroy", @comment)
#       flash.now[:success] = "You've deleted the comment."
#     end
#   end
#
# private
#
#   def comment_params
#     params.require(:comment).permit(:body, :image)
#   end
#
# end
