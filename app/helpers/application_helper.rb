# frozen_string_literal: true

module ApplicationHelper
  def collect_task_name(object)
    object.collect { |p| p['task_name'] }.join('</div><div>').html_safe
  rescue StandardError
    ''
  end
end
