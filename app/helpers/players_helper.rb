module PlayersHelper
  def player_federation_menu(selected, type="search")
    feds = ICU::Federation.menu(top: "IRL")
    if type == "search"
      feds.unshift([t("player.any_federation"), ""])
      feds.insert(2, [t("unknown"), "???"])
      feds.insert(2, [t("player.not_foreign"), "NNN"])
      feds.insert(2, [t("player.foreign"), "FFF"])
    elsif type == "select"
      feds.unshift([t("please_select"), ""])
    else
      feds.unshift([t("unknown"), ""])
    end
    options_for_select(feds, selected)
  end

  def player_gender_menu(selected, default="any")
    genders = Player::GENDERS.map { |g| [t("player.gender.#{g}"), g] }
    genders.unshift [t(default), ""]
    options_for_select(genders, selected)
  end

  def player_order_menu(selected)
    orders = %w[last_name first_name].map { |col| [t("player.#{col}"), col] }
    orders.unshift [t("player.id_order"), "id"]
    options_for_select(orders, selected)
  end

  def player_privacy_menu(selected)
    privacies = []
    Player::PRIVACIES.each do |privacy|
      if privacy.match(/\A([a-z]+)_phone\z/)
        privacies.push [t("player.phone.#{$1}", locale: "en"), privacy]
      end
    end
    options_for_select privacies, selected.try(:split)
  end

  def player_yob_relation_menu(selected)
    options_for_select(%w[= < >], selected)
  end

  def player_status_menu(selected, opt={})
    statuses = Player::STATUSES.map { |g| [t("player.status.#{g}"), g] }
    statuses.push [t("any"), ""] if opt[:any]
    options_for_select(statuses, selected)
  end

  def player_duplicate_menu(selected)
    dups = [
      [t("player.non_duplicate"), "false"],
      [t("player.duplicate"), "true"],
      [t("any"), ""],
    ]
    options_for_select(dups, selected)
  end

  def player_title_menu(selected)
    titles =
    {
      t("player.title.title") =>
      [
        [t("player.any_title"), ""],
        [t("player.some_title"), "XX"],
        [t("player.title.player"), "PP"],
        [t("player.title.arbiter"), "AA"],
        [t("player.title.trainer"), "TT"],
      ],
      t("player.title.player") => Player::PLAYER_TITLES.map { |t| [t, t] },
      t("player.title.arbiter") => Player::ARBITER_TITLES.map { |t| [t, t] },
      t("player.title.trainer") => Player::TRAINER_TITLES.map { |t| [t, t] },
    }
    grouped_options_for_select(titles, selected)
  end

  def player_title_player_menu(selected)
    titles = Player::PLAYER_TITLES.map { |t| [t, t] }
    titles.unshift([t("none"), ""])
    options_for_select(titles, selected)
  end

  def player_title_arbiter_menu(selected)
    titles = Player::ARBITER_TITLES.map { |t| [t, t] }
    titles.unshift([t("none"), ""])
    options_for_select(titles, selected)
  end

  def player_title_trainer_menu(selected)
    titles = Player::TRAINER_TITLES.map { |t| [t, t] }
    titles.unshift([t("none"), ""])
    options_for_select(titles, selected)
  end
end
