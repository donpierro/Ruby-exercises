require './config.rb'
require './post_comment.rb'

class BugTest < Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def test_association_stuff
    post = Post.create!
    post.comments << Comment.create!

    assert_equal 1, post.comments.count
    assert_equal 1, Comment.count
    assert_equal post.id, Comment.first.post.id
  end

  def test_by_types_method
    ['video', 'article', 'article'].each { |type| Post.create(post_type: type) }

    assert_equal(2, Post.by_types.count)
    assert_equal(1, Post.by_types('video').count)
  end

  def test_for_videos_method
    post = Post.create(post_type: 'video')
    comment = Comment.create!
    post.comments << comment

    assert_equal([comment], Comment.for_videos)
    assert_equal(1, Comment.for_videos.count)
  end

  def test_post_type_method
    post = Post.create(post_type: 'video')
    comment = Comment.create!
    post.comments << comment

    assert(comment.post_type, 'video')
  end

  def test_post_type_method_for_nil_case
    comment = Comment.create!

    assert_equal(nil, comment.post_type)
  end
end
