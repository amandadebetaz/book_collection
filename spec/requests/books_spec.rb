require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    it "adds a book successfully" do
      expect {
        post books_path, params: { book: { title: "Throne of Glass" } }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response.body).to include("Book was successfully created.")
    end

    it "does not add a book without a title" do
      expect {
        post books_path, params: { book: { title: "" } }
      }.not_to change(Book, :count)

      expect(response.body).to include("Book title cannot be blank.")
    end

    it "adds a book with an author" do
        post books_path, params: {
            book: {
                title: "Throne of Glass",
                author: "Sarah J. Maas"
            }
        }

        expect(Book.last.author).to eq("Sarah J. Maas")
    end

    it "adds a book with a price" do
        post books_path, params: {
            book: {
                title: "Throne of Glass",
                price: 14.99
            }
        }

        expect(Book.last.price).to eq(14.99)
    end

    it "adds a book with a published date" do
        post books_path, params: {
            book: {
                title: "Throne of Glass",
                published_date: Date.new(2012, 8, 7)
            }
        }

        expect(Book.last.published_date).to eq(Date.new(2012, 8, 7))
    end
  end
end