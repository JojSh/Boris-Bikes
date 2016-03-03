class Garage

  def service_shipment(broken_things)
    fix(broken_things)
  end

private
  def fix(broken_things)
    broken_things.map { |thing| thing.working= true }
    fixed_things = broken_things
  end
end
