module PostsHelper
  def catch_phrase
    CatchPhrase.first ? CatchPhrase.first.phrase : nil
  end
end
