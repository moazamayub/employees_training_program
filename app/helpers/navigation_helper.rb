module NavigationHelper
  def sidebar_link_class(path)
    base_classes = "flex items-center gap-3 px-3.5 py-2.5 rounded-lg text-sm font-medium transition-colors"
    if current_page?(path)
      "#{base_classes} bg-blue-700 text-white shadow-sm"
    else
      "#{base_classes} text-blue-100 hover:bg-blue-800/60 hover:text-white"
    end
  end
end