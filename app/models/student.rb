class Student < ActiveRecord::Base
  attr_accessible :active, :name, :klass_ids
  has_many :klasses_students, dependent: :destroy
  has_many :klasses, through: :klasses_students
  has_many :lessons, through: :klasses
  has_many :registrations, through: :lessons
  has_many :student_registrations, class_name: 'Registration', foreign_key: 'student_id', dependent: :destroy
  belongs_to :organisation

  validates :name, presence: true, uniqueness: true

  def attendance_met_for(klass)
    klass.student_attendance(self) >= klass.attendance
  end

  def self.import(file, organisation)
    CSV.foreach(file.path, headers: true) do |row|
      student = find_by_id(row["id"]) || new
      student.attributes = row.to_hash.slice(*accessible_attributes)
      student.save!
      organisation.students << student
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end
end
