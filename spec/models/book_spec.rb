require "rails_helper"

RSpec.describe Book, type: :model do
    it "is valid with a title" do
        book = Book.new(title: "Throne of Glass")
        expect(book).to be_valid
    end

    it "is not valid without a title" do
        book = Book.new(title: "")
        expect(book).not_to be_valid
    end

    it "is valid with an author" do
        book = Book.new(author: "Sarah J. Maas")
        expect(book.author).to eq("Sarah J. Maas")
    end

    it "is valid with a price" do
        book = Book.new(price: 14.99)
        expect(book.price).to eq(14.99)
    end

    it "is valid with a published date" do
        book = Book.new(published_date: Date.new(2012, 8, 7))
        expect(book.published_date).to eq(Date.new(2012, 8, 7))
    end
end