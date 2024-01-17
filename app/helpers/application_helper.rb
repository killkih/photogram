# frozen_string_literal: true

module ApplicationHelper

  def flash_message(argument)
    return unless flash[argument].present?

    content_tag :div, flash[argument], class: "flash #{argument}"
  end

end
