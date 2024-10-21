module FormHelper
  def form_error(errors, key)
    error = errors&.find { |error| error.attribute.to_sym == key.to_sym }
    return nil unless error

    message = "#{key.to_s.humanize.capitalize} #{error.message}"
    content_tag(:div, message, class: form_error_classes)
  end

  def form_error_classes
    %w[
      bg-red-500
      text-white
      rounded-md
      shadow-lg
      px-4
      py-2
      border
      border-red-600
    ]
  end
end
