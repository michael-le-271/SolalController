clear; clc;
latlong = importdata('Cities.txt');
year = input("Enter Year: ");
month = input("Enter Month: ");
days = input("Input Day: ");
longitude = -105;
lat = 40;
timezone = -6;

t = datetime(year,month,days);
d = day(t, 'dayofyear');
if mod(year, 4) == 0
    day_total = 366;
else
    day_total = 365;
end
hour = 0:23;
gamma = zeros(1,length(hour)-1);
for i = 1:length(hour)
    gamma(i)=2.*pi/day_total.*(d-1+((hour(i)-12)/24));
end

eqtime = 229.18*(0.000075 + 0.001868*cos(gamma) - 0.032077*sin(gamma) - 0.014615*cos(2*gamma) - 0.040849*sin(2*gamma));
decl = 0.006918 - 0.399912*cos(gamma) + 0.070257*sin(gamma) - 0.006758*cos(2*gamma) + 0.000907*sin(2*gamma) - 0.002697*cos(3*gamma) + 0.00148*sin(3*gamma);

time_offset = eqtime + 4*longitude - 60*timezone;
tst = hour*60 + time_offset;
ha = (tst / 4) - 180;

zenith = acos(sind(lat).*sin(decl) + cosd(lat).*cos(decl).*cosd(ha));
zenith=rad2deg(zenith);

elevation = 90-zenith;
