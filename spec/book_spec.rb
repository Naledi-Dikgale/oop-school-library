require_relative '../book'

describe Book do
  before :each do
    @book = Book.new 'Something', 'Someone'
  end

  it 'takes two parameters and returns a Book object' do
    expect(@book).to be_instance_of Book
  end

  it 'has two attributes: title and author' do
    expect(@book).to have_attributes(title: 'Something', author: 'Someone')
  end

  it 'has a method add_rental' do
    expect(@book).to respond_to(:add_rental)
  end
end
