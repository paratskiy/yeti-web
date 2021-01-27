# frozen_string_literal: true

module FeatureTestHelper
  def select_by_value(value, from:)
    option_name = ''
    select = find_field(from)
    within select do
      option_name = page.find(:xpath, ".//option[@value = '#{value}']").text
    end
    select option_name, from: from
  end

  # useful when we need to click somewhere outside input/modal
  def click_on_text(text)
    page.find(:xpath, "//*[text()='#{text}']").click
  end

  # adds chosen fill for capybara/active_admin DSL
  def fill_in_chosen(label, options = {})
    ajax = options.fetch(:ajax, false)
    disabled = options.fetch(:disabled, false)
    no_search = options.fetch(:no_search, false)
    multiple = options.fetch(:multiple, false)
    value = options.delete(:with)
    select_node = find_field(label, visible: false, disabled: disabled)
    chosen_selector = "select##{select_node[:id]} + .chosen-container"
    if no_search
      chosen_pick(chosen_selector, text: value)
    else
      chosen_select(chosen_selector, search: value, multiple: multiple, ajax: ajax)
    end
  end

  # override Capybara::ActiveAdmin::Selectors::Form#has_many_fields_selector
  # @param association_name [String]
  # @return [String] selector.
  def has_many_fields_selector(association_name)
    ".has_many_container.#{association_name} > fieldset.inputs.has_many_fields"
  end
end
