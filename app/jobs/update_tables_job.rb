class UpdateTablesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    # can put this debugging statement here but it doesn't display well.
    # going to work on pulling the data manually next and then connecting that here,
    # and then parsing it into the db on callback
    # currently calling in a console with UpdateTablesJob.perform_later('fake_arg', 5)
    # require 'pry'; binding.pry
    puts "running job"
  end
end
