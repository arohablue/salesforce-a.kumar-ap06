public class JSON2Apex {

	public String status;
	public List<String> origin_addresses;
	public List<String> destination_addresses;
	public List<Rows> rows;

	public class Duration {
		public Integer value;
		public String text;
	}

	public class Elements {
		public String status;
		public Duration duration;
		public Duration distance;
	}

	public class Rows {
		public List<Elements> elements;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}