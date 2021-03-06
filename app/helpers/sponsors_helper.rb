module SponsorsHelper
  private

  # @param sponsor [Sponsor]
  def link_to_sponsor(sponsor)
    link_to sponsor.name, click_on_sponsor_path(sponsor), target: '_blank'
  end

  # @param sponsor [Sponsor]
  def image_link_to_sponsor(sponsor)
    link_to click_on_sponsor_path(sponsor), target: '_blank', title: sponsor.name, class: 'sponsor' do
      sponsor.record_eyeball
      image_tag sponsor.logo.url
    end
  end

  def image_link_to_random_sponsor
    sponsor = Sponsor.random
    link_to click_on_sponsor_path(sponsor), target: '_blank', title: sponsor.name, class: 'sponsor' do
      sponsor.record_eyeball
      image_tag sponsor.logo.url
    end
  end
end
