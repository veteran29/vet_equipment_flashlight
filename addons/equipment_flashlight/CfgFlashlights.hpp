
class CFG_FLASHLIGHTS {
    class Default {
        class White {
            color[] = {0.5, 0.5, 0.5};
            colorAmbient[] = {0.1, 0.1, 0.1};
            intensity = 100;

            flare = 1;
            flareSize = 0.1;
            flareDistance = 15;

            dayLight = 1;
            infrared = 0;

            lightConePars[] = {125, 30, 7};
            // https://community.bistudio.com/wiki/setLightAttenuation
            lightAttenuation[] = {
                5,      // distance at which light strength starts falling off
                0.3,    // constant light falloff factor
                0.1,    // linear light falloff factor (factor * distance)
                0.0035, // quadratic light falloff factor (factor * distance^2)
                10,     // max distance hard limit start (start of fading of intensity to 0)
                125     // max distance hard limit end (end of fading of intensity to 0)
            };
        };
        class IR: White {
            infrared = 1;
        };
    };

    class Fulton {
        class White {
            flareSize = 0.6;
        };
        class Red: White {
            color[] = {0.5, 0.1, 0.1};
            colorAmbient[] = {0.1, 0, 0};
        };
        class Blue: White {
            color[] = {0.1, 0.1, 0.5};
            colorAmbient[] = {0, 0, 0.1};
        };
    };
};

class GVAR(Default) {
    flashlight = "Default";

    attachBone = "";
    attachBoneFollow = 0;

    attachOffset[] = {0, 0, 1.1};
    attachVectorDir[] = {0, 1, 0};
    attachVectorUp[] = {0, 0, 1};
};

class CFG_EQUIPMENT {
    class H_HelmetSpecB: GVAR(Default) {

        attachBone = "head";
        attachBoneFollow = 1;

        attachOffset[] = {-0.19, -0.1, 0.1};
        attachVectorDir[] = {0, 1, 0.02};
    };

    class CUP_V_B_RRV_Scout2: GVAR(Default) {
        flashlight = "Fulton";

        attachBone = "spine3";

        attachOffset[] = {0.17, 0.165, -0.078};
        attachVectorDir[] = {-0.1, 1, 0.55};
    };
    class CUP_V_B_RRV_Scout2_CB: CUP_V_B_RRV_Scout2 {};
};
