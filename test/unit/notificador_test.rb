require 'test_helper'

class NotificadorTest < ActionMailer::TestCase
  test "hello_world" do
    @expected.subject = 'Notificador#hello_world'
    @expected.body    = read_fixture('hello_world')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notificador.create_hello_world(@expected.date).encoded
  end

end
