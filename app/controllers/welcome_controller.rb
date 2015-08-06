class WelcomeController < ApplicationController
  def index
  end

  def import
  end

  def upload
    # contents = params[:upload].read if params[:upload]

    print "File to upload : "
    print params[:upload][:file].original_filename
    contents = params[:upload][:file].read

    if contents
      json = JSON.parse contents

      Comment.delete_all
      Author.delete_all
      Document.delete_all

      json.each do |record|
        comments_rec = record['comments']
        author_rec = record['author']

        author = Author.where("first_name = ? and last_name = ?","#{author_rec['first']}","#{author_rec['last']}").take

        if author
          puts "exists "
          puts author.id
        else
          author = Author.new({email: author_rec['email'], first_name: author_rec['first'], last_name: author_rec['last']})
          author.id = 0 unless author.save
        end

        document = Document.new({
          title: record['title'],
          body: record['body'],
          company: record['company'],
          author_id: Author.find(author.id),
          picture: record['picture'],
          is_active: record['is_active'],
          id_book: record['id'],
          tags: record['tags'].join(" ")
          })

        document.save

        comments_rec.each do |comment_rec|
          
          comment = Comment.new({
            message: comment_rec['message'],
            document_id: document.id
            })
          comment.save
        end

      end





    end

    redirect_to :action => 'import'
  end
end
