class ImageSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :images

  def added_date
    object.created_at.strftime("%b %d, %Y")
  end

  def images
    image_array = object.images.sort_by {|image| image.created_at }.map do |img|
      {id: img.id, url: img.url, added_date: img.created_at.strftime("%b %d, %Y"), desc: img.description}
    end

    image_array.reverse!
  end
end
class ImageSetSerializer < ActiveModel::Serializer
  attributes :id
end
