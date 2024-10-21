module Sort
  class Validator
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :data, :strategy

    validates :data, :strategy, presence: true
    validates :data,
                format: {
                  with: /\A[a-z]+\z/,
                  message: "only allows small case letters"
                }
    validates :strategy,
                inclusion: {
                  in: Sort::Service::STRATEGIES.keys,
                  message: "%{value} is not a valid strategy"
                }
  end
end
