
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
};

class GVAR(equipmentDefault) {
    flashlight = "Default";

    attachBone = "";
    attachBoneFollow = 1;

    attachOffset[] = {0, 0, 0};
    attachVectorDir[] = {0, 1, 0};
    attachVectorUp[] = {0, 0, 1};
};

class CFG_EQUIPMENT {
    class H_HelmetSpecB: GVAR(equipmentDefault) {
        attachBone = "head";

        attachOffset[] = {-0.19, -0.1, 0.1};
        attachVectorDir[] = {0, 1, 0.02};
    };
};
