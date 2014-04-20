def pmu_format!(race_array)
  # TODO: modify the given array so that it is PMU-consistent
  nb_horses = race_array.length

  race_array.reverse!

  race_array.map! { |e| (nb_horses - race_array.index(e)).to_s + '-' + e + '!' }
end
