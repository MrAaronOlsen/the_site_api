class AboutSerializer < ActiveModel::Serializer
  attributes :id, :body, :name, :attachments
end
