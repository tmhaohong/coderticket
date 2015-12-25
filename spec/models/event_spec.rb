require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#purchase" do
    before do
      # Create Regions
      ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong'].each do |r|
        Region.create(name: r)
      end
      # Create Categories
      ['Entertainment', 'Learning', 'Everything Else'].each do |c|
        Category.create(name: c)
      end

      dalat = Venue.create({
        name: 'Da Lat City',
        full_address: 'Ngoc Phat Hotel 10 Hồ Tùng Mậu Phường 3, Thành phố Đà Lạt, Lâm Đồng, Thành Phố Đà Lạt, Lâm Đồng',
        region: Region.find_by(name: 'Lam Dong')
      })

      @event = Event.create({
        name: 'Việt Nam Thử Thách Chiến Thắng',
        starts_at: DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'),
        ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
        venue: dalat,
        category: Category.find_by(name: 'Everything Else'),
        hero_image_url: 'https://az810747.vo.msecnd.net/eventcover/2015/10/25/C6A1A5.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter',
        extended_html_description: <<-DESC
          <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
        DESC
      })

      @old_event = Event.create({
        name: 'Việt Nam Chiến Thắng',
        starts_at: DateTime.parse('Fri, 11 Mar 2015 7:00 AM+0700'),
        ends_at: DateTime.parse('Sun, 13 Mar 2015 3:00 PM+0700'),
        venue: dalat,
        category: Category.find_by(name: 'Everything Else'),
        hero_image_url: 'https://az810747.vo.msecnd.net/eventcover/2015/10/25/C6A1A5.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter',
        extended_html_description: <<-DESC
          <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
        DESC
      })
    end

    it "Show all event in future" do
      events = Event.search(nil)
      expect(events.size).to equal(1)
      expect(events[0].name).to eq('Việt Nam Thử Thách Chiến Thắng')
    end

    it "No result with abc" do
      events = Event.search("No result")
      expect(events.size).to equal(0)
    end

    it "No result with past event" do
      events = Event.search("Việt Nam Chiến Thắng")
      expect(events.size).to equal(0)
    end

    it "One result with future event" do
      events = Event.search("Việt Nam")
      expect(events.size).to equal(1)
    end
  end
end
