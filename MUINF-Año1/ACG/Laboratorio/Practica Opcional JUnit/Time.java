


import java.util.Calendar;


/**
 * Simple representation of a time of day, using the 24-hour clock.
 *
 * <p>Time objects can be created to represent the current time or a time
 * specified by the user in hours, minutes and seconds.</p>
 *
 * <p>Although Time objects are themselves immutable, calling the
 * {@link #plus(int)} method will yield a new object advanced by
 * the specified number of seconds relative to the object on which
 * the method was called.</p>
 *
 * @author Nick Efford
 * modified by Natalia Criado
 */
public class Time {
  // Class constants (shared by all Time objects)

  private static final int SECONDS_PER_MINUTE = 60;
  private static final int MINUTES_PER_HOUR = 60;
  private static final int SECONDS_PER_HOUR = 3600;
  private static final int HOURS_PER_DAY = 24;

  // Instance variables

  private int hours;
  private int minutes;
  private int seconds;


 

  /**
   * Creates a Time object representing a user-specified time.
   *
   * <p>Note that the hours component must be specified using the
   * 24-hour clock.</p>
   *
   * @param h hours
   * @param m minutes
   * @param s seconds
   *
   * @throws IllegalArgumentException if hours, minutes or seconds are invalid
   */
  public Time(int h, int m, int s) {
	  if (h < 0 || h > HOURS_PER_DAY) {
	      throw new IllegalArgumentException("hours out of range");
	    }
	    else if (m < 0 || m >= MINUTES_PER_HOUR) {
	      throw new IllegalArgumentException("minutes out of range");
	    }
	    else if (s < 0 || s >= SECONDS_PER_MINUTE) {
	      throw new IllegalArgumentException("seconds out of range");
	    }
	    else {
	      hours = h;
	      minutes = m;
	      seconds = s;
	    }
  }





  /**
   * @return Hours component of this time
   */
  public int getHours() {
    return hours;
  }


  /**
   * @return Minutes component of this time
   */
  public int getMinutes() {
    return minutes;
  }


  /**
   * @return Seconds component of this time
   */
  public int getSeconds() {
    return seconds;
  }


  /**
   * Formats this time as a string containing hours, minutes and seconds.
   *
   * Leading zeroes are added to values if necessary and components are
   * separated from each other by a colon.
   *
   * @return String representation of this time
   */
  @Override
  public String toString() {
    return String.format(
      "%02d:%02d:%2d", getHours(), getMinutes(), getSeconds());
  }


  /**
   * Tests whether this time is equal to another.
   *
   * <p>The two objects are considered equal if both are instances of
   * the Time class <em>and</em> both represent exactly the same
   * time of day.</p>
   *
   * @return true if this Time object is equal to the other, false otherwise
   */
  @Override
  public boolean equals(Object other) {
    if (other == this) {
      // 'other' is same object as this one!
      return true;
    }
    else if (! (other instanceof Time)) {
      // 'other' is not a Time object
      return false;
    }
    else {
      // Compare fields
      Time otherTime = (Time) other;
      return getHours() == otherTime.getHours()
          && getMinutes() == otherTime.getMinutes()
          && getSeconds() == otherTime.getSeconds();
    }
  }




  /**
   * Expresses this time as a single integer value - the number of seconds
   * since midnight.
   *
   * @return Number of seconds
   */
  public int inSeconds() {
    int hourSec = SECONDS_PER_HOUR * getHours();
    int minSec = SECONDS_PER_MINUTE * getMinutes();
    return hourSec + minSec + getSeconds();
  }


  /**
   * Creates a Time object advanced in time relative to this one by
   * a user-specified number of seconds.
   *
   * @param sec number of seconds to advance
   * @return Time object advanced in time relative to this one
   * @throws IllegalArgumentException if number of seconds is negative
   */
  public Time plus(int sec) {
    if (sec < 0) {
      throw new IllegalArgumentException("invalid number of seconds");
    }
    else {
      int future = this.inSeconds() + sec;
      int h = (future / SECONDS_PER_HOUR) % HOURS_PER_DAY;
      int remainder = future % SECONDS_PER_HOUR;
      int m = remainder / SECONDS_PER_MINUTE;
      int s = remainder % SECONDS_PER_MINUTE;
      return new Time(h, m, s);
    }
  }




  public boolean set(int h, int m, int s) {
    if (h < 0 || h > HOURS_PER_DAY) {
      return false;
    }
    else if (m < 0 || m > MINUTES_PER_HOUR) {
    	return false;
    }
    else if (s < 0 || s >= SECONDS_PER_MINUTE) {
    	return false;
    }
    else {
      hours = h;
      minutes = m;
      seconds = s;
      return true;
    }
  }
}
