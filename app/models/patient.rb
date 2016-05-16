class Patient < ActiveRecord::Base
  belongs_to :location

  #after_create :mr

  scope :active,  -> { where(deletion: false) }
  scope :deletion,  -> { where(deletion: true) }

  # no use
  def mr
    mr_no = ''
    case self.id.to_s.length
    when 1
      mr_no = '00000'+self.id.to_s
    when 2
      mr_no = '0000'+self.id.to_s
    when 3
      mr_no = '000'+self.id.to_s
    when 4
      mr_no = '00'+self.id.to_s
    when 5
      mr_no = '0'+self.id.to_s
    when 6
      mr_no = self.id.to_s
    end
    self.update_column(:medical_record_no, mr_no)
    #self.medical_record_no = mr_no
    #self.save
  end
end
