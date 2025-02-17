class PostsController < ApplicationController
    # Hiển thị danh sách bài viết
    def index
      @posts = Post.all
    end
  
    # Hiển thị form tạo bài viết mới
    def new
      @post = Post.new
    end
  
    # Tạo bài viết mới
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: "Bài viết đã được tạo thành công!"
      else
        render :new
      end
    end
  
    # Hiển thị chi tiết bài viết
    def show
      @post = Post.find(params[:id])
    end
  
    # Hiển thị form chỉnh sửa bài viết
    def edit
      @post = Post.find(params[:id])
    end
  
    # Cập nhật bài viết
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path, notice: "Bài viết đã được cập nhật thành công!"
      else
        render :edit
      end
    end
  
    # Xóa bài viết
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: "Bài viết đã được xóa thành công!"
    end
  
    private
    # Chỉ cho phép các tham số hợp lệ được truyền vào
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end