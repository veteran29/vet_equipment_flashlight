
class ace_arsenal_stats {
    class statBase;
    class GVAR(intensity): statBase {
        scope = 2;

        displayName = "Flashlight intensity /loc";
        priority = -1;

        showText = 1;
        textStatement = QUOTE([(_this select 1)] call FUNC(getStatIntensity));

        condition = QUOTE((configName (_this select 1)) call FUNC(hasFlashlight));

        tabs[] = {
            {3,4,5,6},
            {}
        };
    };
};

class ace_arsenal_sorts {
    class sortBase;
    class GVAR(intensity): sortBase {
        scope = 2;

        displayName = "Sort by flashlight intensity /loc";

        statement = QUOTE((call FUNC(getStatIntensity) * -1));

        tabs[] = {
            {3,4,5,6},
            {}
        };
    };
};
