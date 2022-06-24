class ZaibatsuSyncsController < ApplicationController
  include ActionController::Live

  def create
    response.headers['Last-Modified'] = Time.now.httpdate
    response.stream.write "Refreshing * "
    browser = Ferrum::Browser.new({timeout: 30})
    browser.go_to BROWN_ZAIBATSU_URL_1
    wait_for { browser.at_css('input[name=UserName]') }
    # sleep2 5
    browser.screenshot(path: "/tmp/1.png"); `open /tmp/1.png`
    elem = browser.at_css('input[name=UserName]')
    elem.focus
    elem.type(current_user.my_settings.zaibatsu_username)
    elem = browser.at_css('input[name=Password]')
    elem.focus
    elem.type(current_user.my_settings.zaibatsu_password, :enter)
    sleep2 3
    wait_for { browser.at_css('button#continue-button') }
    browser.screenshot(path: "/tmp/2.png"); `open /tmp/2.png`
    sleep2 5
    browser.at_css("button#continue-button").click
    sleep2 7
    browser.pages.last.screenshot(path: "/tmp/3.png"); `open /tmp/3.png`
    browser.pages.last.execute '$("a#mnuTransactions:visible").click()'
    # browser.pages.last.css('a#mnuTransactions').first.click rescue (puts "rescued")
    # sleep2 3
    # browser.pages.last.css('a#mnuTransactions').first.click rescue (puts "rescued")
    sleep2 1
    #browser.pages.last.at_css('.open-menu-toggle.active a#mnuTransactions').click
    #sleep2 5
    # browser.pages.last.screenshot(path: "/tmp/4.png"); `open /tmp/4.png`
    ajax = browser.pages.last.network.traffic.select { |item|
      item.request.url =~ /GetTransactionList/
    }.first
    Property.import( JSON.parse(ajax.response.body), current_user )
    browser.quit
  rescue StandardError => e
    puts "##### #{e} #####"
    puts e.backtrace
    response.stream.write "<p>ERROR: An error occured</p>"
  ensure
    handoff
    response.stream.close
  end

  private

  def wait_for
    response.stream.write "&lt;"
    10.times do
      result = yield
      break if result.present?
      sleep3 1
    end
    response.stream.write "&gt;"
  end

  def sleep2(number)
    response.stream.write " #{number} "
    number.times do
      response.stream.write "*"
      sleep 1
    end
  end

  def sleep3(number)
    number.times do
      response.stream.write "+"
      sleep 1
    end
  end

  def display(string)
    response.stream.write "#{string}"
    response.stream.write '<script>window.scrollTo(0, document.body.scrollHeight);</script>'
    response.stream.write '<br>'
    sleep 0.05
  end

  def handoff
    sleep 0.4
    display '<br>Navigating to <a href="/my_properties">/my_properties</a>'
    sleep 2
    display '<script>window.location.href = "/my_properties";</script>'
  end
end
