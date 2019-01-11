require 'test_helper'

class EventTest < ActiveSupport::TestCase

  def setup
    @event = Event.new(
      name: 'Testinsg', 
      career: 'Resdes', 
      description: 'Loremp ipsum', 
      location: 'City', 
      start_date: '2018-12-06 20:42:43', 
      end_date: '2018-12-06 20:42:43')
  end

  # Validations
  test 'Event: should not save if not name' do
    @event.name = nil
    assert_not @event.save, 'Event saved whitout name'
  end

  test 'Event: should not save if not career' do
    @event.career = nil
    assert_not @event.save, 'Event saved whitout career'
  end

  test 'Event: should not save if not description' do
    @event.description = nil
    assert_not @event.save, 'Event saved whitout description'
  end

  test 'Event: should not save if not location' do
    @event.location = nil
    assert_not @event.save, 'Event saved whitout location'
  end

  test 'Event: should not save if not start_date' do
    @event.start_date = nil
    assert_not @event.save, 'Event saved whitout start_date'
  end

  test 'Event: should not save if not end_date' do
    @event.end_date = nil
    assert_not @event.save, 'Event saved whitout end_date'
  end

  # Scopes

end
