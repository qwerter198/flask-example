import pytest
from datetime import datetime
from common.utils import TimeUtils


class TestTimeUtils:

    def test_get_now_default_format(self) -> None:
        current_time = TimeUtils.get_now()
        assert isinstance(current_time, str)

    def test_str_to_datetime(self) -> None:
        date_str = '2023-08-08 12:34:56'
        expected_datetime = datetime(2023, 8, 8, 12, 34, 56)
        result_datetime = TimeUtils.str_to_datetime(date_str)
        assert result_datetime == expected_datetime

    def test_datetime_to_str(self) -> None:
        date = datetime(2023, 8, 8, 12, 34, 56)
        expected_date_str = '2023-08-08 12:34:56'
        result_date_str = TimeUtils.datetime_to_str(date)
        assert result_date_str == expected_date_str

    def test_day_number_of_month(self) -> None:
        date = datetime(2023, 8, 8, 12, 34, 56)
        expected_days = 31  # August has 31 days
        result_days = TimeUtils.day_number_of_month(date)
        assert result_days == expected_days

    def test_sum_up_time_has_hour(self) -> None:
        base_date = '2023-08-08 12:34:56'
        expected_date = '2023-09-08 14:34:56'
        result_date = TimeUtils().sum_up_time(base_date, months=1, hours=2)
        assert result_date == expected_date

    def test_sum_up_time_no_hour(self) -> None:
        base_date = '2023-08-08 12:34:56'
        expected_date = '2023-09-10 12:34:56'
        result_date = TimeUtils().sum_up_time(base_date, months=1, days=2)
        assert result_date == expected_date

    def test_check_time_format_valid(self) -> None:
        valid_date_str = '2023-08-08 12:34:56'
        # Should not raise an exception
        TimeUtils.check_time_format(valid_date_str)

    def test_check_time_format_invalid(self) -> None:
        invalid_date_str = '08-08-2023 12:34:56'
        with pytest.raises(Exception, match='Date format error'):
            TimeUtils.check_time_format(invalid_date_str)


# if __name__ == '__main__':
#     pytest.main()
