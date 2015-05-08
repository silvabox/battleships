class Cell
  attr_accessor :content

  def receive_shot
    @shot = true
    content.hit unless empty?
  end

  def shot?
    @shot
  end

  def empty?
    !content
  end
end
