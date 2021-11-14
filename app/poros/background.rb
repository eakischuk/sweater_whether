class Background
  attr_reader :image_urls, :credit
  def initialize(background)
    @id = nil
    @image_urls = background[:results].first[:urls]
    @credit = user_attr(background[:results].first[:user])
  end

  def user_attr(user)
    {
      user_name: user[:name],
      user_portfolio_url: user[:portfolio_url]
    }
  end
end
