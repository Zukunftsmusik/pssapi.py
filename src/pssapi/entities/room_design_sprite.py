from ..types import EntityInfo as _EntityInfo
from .entity_base import EntityWithIdBase as _EntityWithIdBase
from .raw import RoomDesignSpriteRaw as _RoomDesignSpriteRaw


class RoomDesignSprite(_RoomDesignSpriteRaw, _EntityWithIdBase):
    def __init__(self, room_design_sprite_info: _EntityInfo) -> None:
        super().__init__(room_design_sprite_info)

    @property
    def id(self) -> int:
        return self.room_design_sprite_id
