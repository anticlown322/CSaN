using System;

namespace lab4
{
    public class Rootobject
    {
        public int code { get; set; }
        public string status { get; set; }
        public Result result { get; set; }
    }

    public class Result
    {
        public string query { get; set; }
        public int total { get; set; }
        public int duration { get; set; }
        public Hit[] hits { get; set; }
        public Links links { get; set; }
    }

    public class Links
    {
        public string next { get; set; }
        public string prev { get; set; }
    }

    public class Hit
    {
        public Service[] services { get; set; }
        public Autonomous_System autonomous_system { get; set; }
        public string ip { get; set; }
        public DateTime last_updated_at { get; set; }
        public Location location { get; set; }
    }

    public class Autonomous_System
    {
        public string bgp_prefix { get; set; }
        public string name { get; set; }
        public string country_code { get; set; }
        public string description { get; set; }
        public int asn { get; set; }
    }

    public class Location
    {
        public string timezone { get; set; }
        public string continent { get; set; }
        public string country { get; set; }
        public string country_code { get; set; }
        public string province { get; set; }
        public string city { get; set; }
        public Coordinates coordinates { get; set; }
    }

    public class Coordinates
    {
        public float latitude { get; set; }
        public float longitude { get; set; }
    }

    public class Service
    {
        public int port { get; set; }
        public string service_name { get; set; }
        public string extended_service_name { get; set; }
        public string transport_protocol { get; set; }
    }

}
