module EventsHelper
  def event_category_menu(selected, default=nil)
    cats = Event::CATEGORIES.map { |cat| [t("event.category.#{cat}"), cat] }
    cats.unshift([t(default), ""]) if default
    options_for_select(cats, selected)
  end

  def event_month_menu(selected)
    months = (1..12).map { |m| m = "%02d" % m; [t("month.m#{m}"), m] }
    options_for_select(months, selected)
  end

  def event_year_menu(selected)
    years = (2005..Date.today.year).to_a.reverse.map { |y| [y, y] }
    options_for_select(years, selected)
  end

  def events_menu(selected_event_id, events)
    options_for_select(([Event.new(name: '')] + events).map { |event| [event.name, event.id] }, selected_event_id)
  end

  # @param entry_item [Item::Entry]
  def event_entry_item_description(entry_item)
    if entry_item.player_id
      desc = entry_item.player.name
      if entry_item.player.latest_rating
        desc += " (#{entry_item.player.latest_rating})"
      elsif entry_item.player.legacy_rating
        desc += " (#{entry_item.player.legacy_rating})"
      end
    else
      desc = "Unknown Player"
    end
    desc
  end


  # @param fee_entry [Fee::Entry]
  def event_entry_fee_button(fee_entry)
    descr = fee_entry.name
    extras = []
    if fee_entry.sections.present?
      extras << "Sections: #{fee_entry.sections}"
    end
    if fee_entry.min_age.present?
      extras << "aged #{fee_entry.min_age} or over"
    end
    if fee_entry.max_age.present?
      extras << "aged #{fee_entry.max_age} or under"
    end

    if fee_entry.min_rating.present?
      extras << "rated at least #{fee_entry.min_rating}"
    end

    if fee_entry.max_rating.present?
      extras << "rated at most #{fee_entry.max_rating}"
    end

    link_to(euros(fee_entry.amount), new_item_path(fee_id: fee_entry.id), class: 'btn btn-info btn-sm') +
        content_tag(:span, " #{descr} #{extras.join(', ')}")
  end
end
