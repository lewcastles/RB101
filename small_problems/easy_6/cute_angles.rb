DEGREE = "\xC2\xB0"

def dms(float)
  total_secs = float * 3600
  total_mins, secs = (total_secs).divmod(60)
  total_deg, mins = (total_mins).divmod(60)
  degs = total_deg.divmod(360)[1]
  format("#{degs}#{DEGREE}%02d'%02d\"", mins, secs)
end


puts dms(93.034773)