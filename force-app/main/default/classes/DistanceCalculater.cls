public class DistanceCalculater {
        Double pi = 3.14159;
    
    	public Double distance(Double lat1, Double lon1, Double lat2, Double lon2, String unit) {
		if ((lat1 == lat2) && (lon1 == lon2)) {
			return 0;
		}
		else {
			Double theta = lon1 - lon2;
			Double dist = math.sin(toRadians(lat1)) * math.sin(toRadians(lat2)) + math.cos(toRadians(lat1)) * math.cos(toRadians(lat2)) * math.cos(toRadians(theta));
			dist = math.cos(dist);
			dist = dist * (180/pi);
			dist = dist * 60 * 1.1515;
			if (unit == 'K') {
				dist = dist * 1.609344;
			} else if (unit == 'N') {
				dist = dist * 0.8684;
			}
			return (dist);
		}
	}
    
    public Double toRadians (double value ) {
        System.debug(value *(pi/180));
        return value *(pi/180);
    }
    
    
}