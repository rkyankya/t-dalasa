class EvaluationCriterion < ApplicationRecord
  has_many :target_evaluation_criteria, dependent: :restrict_with_error
  has_many :targets, through: :target_evaluation_criteria
  has_many :timeline_event_grades, dependent: :restrict_with_error

  belongs_to :course

  validates :max_grade, presence: true, numericality: { greater_than: 0 }

  validates :pass_grade,
            presence: true,
            numericality: {
              greater_than: 0,
              less_than_or_equal_to: :max_grade,
            }

  validates :grade_labels, presence: true
  validate :grade_labels_must_match_grades

  validates :name,
            presence: true,
            uniqueness: {
              scope: %i[course_id max_grade pass_grade],
            }

  def display_name
    name + " (#{pass_grade},#{max_grade})"
  end

  private

  def grade_labels_must_match_grades
    return if grade_labels.pluck("grade") == [*1..max_grade]

    errors.add(:grade_labels, "do not match available grades")
  end
end
