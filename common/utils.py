
import datetime
import dateutil.relativedelta
import calendar


class TimeUtils:

    @staticmethod
    def get_now(date_format: str = '%Y-%m-%d %H:%M:%S') -> str:
        return datetime.datetime.now().strftime(date_format)

    @staticmethod
    def str_to_datetime(
            date_str: str,
            date_format: str = '%Y-%m-%d %H:%M:%S') -> datetime.datetime:
        return datetime.datetime.strptime(date_str, date_format)

    @staticmethod
    def datetime_to_str(date: datetime.datetime,
                        date_format: str = '%Y-%m-%d %H:%M:%S') -> str:
        return date.strftime(date_format)

    @staticmethod
    def day_number_of_month(date: datetime.datetime) -> int:
        return calendar.monthrange(date.year, date.month)[1]

    def sum_up_time(self,
                    date: str,
                    months: int = 0,
                    days: int = 0,
                    hours: int = 0,
                    minutes: int = 0,
                    seconds: int = 0,
                    date_format: str = '%Y-%m-%d %H:%M:%S') -> str:
        if months != 0 or days != 0:
            date_datetime = self.str_to_datetime(date, date_format)
            result_datetime = date_datetime + dateutil.relativedelta.relativedelta(
                months=months)
            result_datetime = result_datetime + datetime.timedelta(days=days)
            date = self.datetime_to_str(result_datetime, date_format)
        if hours == 0 and minutes == 0 and seconds == 0:
            return date
        date_datetime = self.str_to_datetime(date, date_format)
        result_datetime = date_datetime + datetime.timedelta(
            hours=hours, minutes=minutes, seconds=seconds)
        result = self.datetime_to_str(result_datetime, date_format)
        return result

    @staticmethod
    def check_time_format(date_str: str, date_format: str = '%Y-%m-%d %H:%M:%S') -> None:
        try:
            date_datetime = TimeUtils.str_to_datetime(date_str, date_format)
            date_str = TimeUtils.datetime_to_str(date_datetime, date_format)
        except Exception:
            raise Exception('Date format error')
