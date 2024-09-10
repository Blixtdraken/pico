@tool
extends Node




func thing():
	if Engine.is_editor_hint():
		(get_node("../Path3D2") as Path3D).curve = (get_node("../Path3D") as Path3D).curve
		var curve:Curve3D = (get_node("../Path3D2") as Path3D).curve
		curve.set_point_in(curve.point_count-1,curve.get_point_in(0))
		curve.set_point_out(curve.point_count-1,curve.get_point_out(0))
		curve.set_point_position(curve.point_count-1,curve.get_point_position(0))
		curve.set_point_tilt(curve.point_count-1,curve.get_point_tilt(0))
	pass
